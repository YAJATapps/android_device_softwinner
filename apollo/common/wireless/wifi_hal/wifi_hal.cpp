/*
 * Copyright (C) 2026 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define LOG_TAG "WifiHalUwe5622"

#include <condition_variable>
#include <cstring>
#include <mutex>
#include <hardware_legacy/wifi_hal.h>
#include <log/log.h>

static int g_dummy_global_handle = 1;
static int g_dummy_iface_handle = 2;
static wifi_interface_handle g_ifaces[] = {
    reinterpret_cast<wifi_interface_handle>(&g_dummy_iface_handle)
};

static std::mutex g_loop_mutex;
static std::condition_variable g_loop_cv;
static bool g_loop_running = false;

extern "C" {

wifi_error wifi_initialize(wifi_handle* handle) {
    if (!handle) {
        return WIFI_ERROR_INVALID_ARGS;
    }
    *handle = reinterpret_cast<wifi_handle>(&g_dummy_global_handle);
    ALOGI("wifi_initialize: initialized global wifi handle");
    return WIFI_SUCCESS;
}

wifi_error wifi_wait_for_driver_ready(void) {
    return WIFI_SUCCESS;
}

void wifi_cleanup(wifi_handle handle, wifi_cleaned_up_handler handler) {
    ALOGI("wifi_cleanup called");
    {
        std::lock_guard<std::mutex> lock(g_loop_mutex);
        g_loop_running = false;
    }
    g_loop_cv.notify_all();
    if (handler) {
        handler(handle);
    }
}

void wifi_event_loop(wifi_handle /* handle */) {
    ALOGI("wifi_event_loop started");
    std::unique_lock<std::mutex> lock(g_loop_mutex);
    g_loop_running = true;
    g_loop_cv.wait(lock, [] { return !g_loop_running; });
    ALOGI("wifi_event_loop cleanly exited");
}

wifi_error wifi_get_ifaces(wifi_handle /* handle */, int* num_ifaces, wifi_interface_handle** ifaces) {
    if (!num_ifaces || !ifaces) {
        return WIFI_ERROR_INVALID_ARGS;
    }
    *num_ifaces = 1;
    *ifaces = g_ifaces;
    ALOGI("wifi_get_ifaces: returning 1 interface (wlan0)");
    return WIFI_SUCCESS;
}

wifi_error wifi_get_iface_name(wifi_interface_handle /* iface */, char* name, size_t size) {
    if (!name || size < 6) {
        return WIFI_ERROR_INVALID_ARGS;
    }
    std::strncpy(name, "wlan0", size - 1);
    name[size - 1] = '\0';
    return WIFI_SUCCESS;
}

wifi_error wifi_get_supported_feature_set(wifi_interface_handle /* iface */, feature_set* set) {
    if (set) {
        *set = 0;
    }
    return WIFI_SUCCESS;
}

wifi_error wifi_early_initialize(void) {
    return WIFI_SUCCESS;
}

wifi_error init_wifi_vendor_hal_func_table(wifi_hal_fn* fn) {
    if (!fn) {
        ALOGE("init_wifi_vendor_hal_func_table: null func table");
        return WIFI_ERROR_INVALID_ARGS;
    }
    fn->wifi_initialize = wifi_initialize;
    fn->wifi_wait_for_driver_ready = wifi_wait_for_driver_ready;
    fn->wifi_cleanup = wifi_cleanup;
    fn->wifi_event_loop = wifi_event_loop;
    fn->wifi_get_ifaces = wifi_get_ifaces;
    fn->wifi_get_iface_name = wifi_get_iface_name;
    fn->wifi_get_supported_feature_set = wifi_get_supported_feature_set;
    fn->wifi_early_initialize = wifi_early_initialize;

    ALOGI("init_wifi_vendor_hal_func_table: successfully populated nl80211 UWE5622 function table");
    return WIFI_SUCCESS;
}

}  // extern "C"
