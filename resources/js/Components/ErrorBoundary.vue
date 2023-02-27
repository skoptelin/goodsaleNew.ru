<template>
    <div>
      <slot
        v-if="err"
        name="error"
        v-bind:err="err"
        v-bind:vm="vm"
        v-bind:info="info"
      >
      Что-то пошло не так
        </slot>
      <slot v-else></slot>
    </div>
</template>
  
<script>
    import Swal from 'sweetalert2';

    export default {
        name: "error-boundary",
        props: {
        stopPropagation: Boolean
        },
        data() {
        return {
            err: false,
            vm: null,
            info: null
        };
        },
        errorCaptured(err, vm, info) {
        this.err = err;
        this.vm = vm;
        this.info = info;

        Swal.fire({
            icon: 'error',
            title: 'Упс...',
            text: 'Что-то пошло не так! Ошибка: ' + err.message,
            confirmButtonColor: '#0EA5E9'
        });
    
        return !this.stopPropagation;
        }
    };
</script>
  
<style lang="scss" scoped>
</style>