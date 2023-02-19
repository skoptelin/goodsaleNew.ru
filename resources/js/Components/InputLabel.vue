<script setup>
defineProps(['value']);
</script>

<template>
    <label class="mt-3 block font-medium text-sm text-sky-500">
        <span v-if="value">{{ value }}</span>
        <span v-else><slot /></span>
    </label>
</template>
