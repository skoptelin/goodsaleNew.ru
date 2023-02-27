<script setup>
import ApplicationLogo from '@/Components/ApplicationLogo.vue';
import ApplicationLogoBlue from '@/Components/ApplicationLogoBlue.vue';
import { Link } from '@inertiajs/vue3';
import NavLink from '@/Components/NavLink.vue';
import ErrorBoundary from '@/Components/ErrorBoundary.vue';
</script>

<template>
    <ErrorBoundary>
        <nav class="bg-sky-500 border-b border-gray-100">
            <!-- Primary Navigation Menu -->
            <div class="max-w-full mx-auto px-4 sm:px-6 lg:px-8">
                <div class="flex justify-between h-16">
                    <div class="flex">
                        <!-- Logo -->
                        <div class="shrink-0 flex">
                            <Link href="/ads">
                                <ApplicationLogo class="w-36 h-4 mt-5" />
                            </Link>
                        </div>

                        <div class="sm:flex sm:items-center sm:ml-6">
                            <!-- Navigation Links -->
                            <div class="mr-8 sm:-my-px sm:flex mt-5">
                                <NavLink :href="route('ads.index')" :active="route().current('ads.index')">
                                    Лента
                                </NavLink>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </nav>

        <div class="min-h-screen flex flex-col sm:justify-center items-center pt-6 sm:pt-0 bg-gray-100">
            <div>
                <Link href="/ads">
                    <ApplicationLogoBlue class="w-auto h-auto mb-20" />
                </Link>
            </div>

            <div
                class="w-full sm:max-w-md mt-6 px-6 py-4 bg-white shadow-md shadow-sky-500 overflow-hidden sm:rounded-lg"
            >
                <slot />
            </div>
        </div>
    </ErrorBoundary>
</template>
