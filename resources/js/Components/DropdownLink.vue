<script setup>
import { Link } from '@inertiajs/vue3';
</script>

<template>
    <Link
        class="block w-full px-4 py-2 text-left text-base leading-5 text-white hover:bg-sky-700 focus:bg-sky-700 transition duration-150 ease-in-out bg-sky-500"
    >
        <slot />
    </Link>
</template>
