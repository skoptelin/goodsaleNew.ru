<script setup>
  import { computed, onBeforeMount } from 'vue';
  import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
  import { Head } from '@inertiajs/vue3';

  const props = defineProps({ 
    status: Number 
  });

  const title = computed(() => {
    return {
      503: '503: Сервис недоступен',
      500: '500: Ошибка сервера',
      404: '404: Страница не найдена',
      403: '403: Доступ запрещен',
    }[props.status]
  });

  const description = computed(() => {
    return {
      503: 'Извините, мы проводим техническое обслуживание. Пожалуйста, зайдите позже.',
      500: 'Ой, что-то пошло не так на наших серверах.',
      404: 'Извините, страница, которую вы ищете, не может быть найдена.',
      403: 'Извините, вам запрещен доступ к этой странице.',
    }[props.status]
  }); 
  
</script>

<template>
  <Head title="Ошибка"/>
  <AuthenticatedLayout>
    <div class="errorDetail">
      <div class="errorTitle">{{ title }}</div>
      <div class="errorDescription">{{ description }}</div>
      <img typeof="gif" src="/@imagetools/logo/goose.gif">
    </div>
  </AuthenticatedLayout>
</template>