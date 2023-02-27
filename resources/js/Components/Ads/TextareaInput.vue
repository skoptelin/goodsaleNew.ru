<script setup>
    import { onMounted, ref } from 'vue';

    defineProps(['modelValue']);

    defineEmits(['update:modelValue']);

    const input = ref(null);

    onMounted(() => {
        if (input.value.hasAttribute('autofocus')) {
            input.value.focus();
        }
    });

    defineExpose({ focus: () => input.value.focus() });
</script>

<template>
    <textarea
        class="border-sky-500 focus:border-sky-700 focus:ring-sky-700 rounded-none shadow-sm"
        :value="modelValue"
        @input="$emit('update:modelValue', $event.target.value)"
        ref="input"
    ></textarea>
</template>
