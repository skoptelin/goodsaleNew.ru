<script setup>
import { computed } from 'vue';
import { Link } from '@inertiajs/vue3';

const props = defineProps(['href', 'active']);

const classes = computed(() =>
    props.active
        ? 'inline-flex items-center h-7 border-b-2 border-white text-base font-medium text-white focus:border-white transition duration-150 ease-in-out'
        : 'inline-flex items-center h-7 border-b-2 border-transparent text-base font-medium text-white hover:text-white hover:border-white focus:text-white focus:border-white transition duration-150 ease-in-out'
);
</script>

<template>
    <Link :href="href" :class="classes">
        <slot />
    </Link>
</template>
