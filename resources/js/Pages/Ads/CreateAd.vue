<script setup>
    import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
    import InputError from '@/Components/InputError.vue';
    import InputLabel from '@/Components/InputLabel.vue';
    import TextInput from '@/Components/TextInput.vue';
    import { Head, router, useForm } from '@inertiajs/vue3';
    import TextareaInput from '@/Components/Ads/TextareaInput.vue';
    import Swal from 'sweetalert2';
    import { Form, Field, ErrorMessage } from 'vee-validate';
    import * as yup from 'yup';
    import { Inertia } from '@inertiajs/inertia';

    Inertia.on('before', (event) => { // Отслеживаем переход на другую страницу, предупреждаем о потере введенных данных при переходе 
        if (isChangedIInputFlag === 'true') {
            event.preventDefault();
            Swal.fire({
                title: 'Вы уверены, что хотите уйти со страницы?',
                text: "Заполненные данные не сохранятся",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#d33',
                cancelButtonColor: '#0EA5E9',
                confirmButtonText: 'Уйти',
                cancelButtonText: 'Остаться'
            }).then((result) => {
                    if (result.isConfirmed) {
                        window.location = event.detail.visit.url.href;
                    }
                })
        }
        
    });

    let isChangedIInputFlag = 'false'; //Флаг изменения инпутов

    function isChangedIInput() {
        if(form.title != '' || form.description !='' || form.price != '' || form.city != '' || form.picture != '') {
            isChangedIInputFlag = 'true';
        } else {
            isChangedIInputFlag = 'false';
        }
        
    };

    const form = useForm({
        title: '',
        description: '',
        price: '',
        city: '',
        picture: '',
    });

    const validate = yup.object({
       title: yup.string().required('Заполните название объявления').max(200, 'Превышено максимальное количество символов: 200'),
       description: yup.string().required('Заполните описание объявления').max(1500, 'Превышено максимальное количество символов: 1500'),
       price: yup.number().positive('Цена должна быть положительным числом').integer('Цена должна быть целым числом'),
       city: yup.string().required('Заполните местоположение').max(200, 'Превышено максимальное количество символов: 200'),
       picture: yup.mixed().required('Загрузите фото')
                    .test('fileFormat', 'Только фото в формате: jpg, jpeg, gif, png', 
                        (value) => {
                            return value && ['image/jpg', 'image/jpeg', 'image/gif', 'image/png'].includes(value.type);
                    }).test('fileSize', 'Размер фото не должен превышать 5 МБ', value => value.size <= 5000000), //value.size on bytes
    });

    const submit = async() => {
        isChangedIInputFlag = 'false';
        try {
            const createAd = await form.post(route('my_ads.store'), {
                onFinish: () =>  Swal.fire({
                                    position: 'top-end',
                                    icon: 'success',
                                    title: 'Объявление создано',
                                    showConfirmButton: false,
                                    timer: 1500
                                })
            });
            
        } catch(error) {
            Swal.fire({
                icon: 'error',
                title: 'Упс...',
                text: 'Что-то пошло не так! Ошибка: ' + error.message,
                confirmButtonColor: '#0EA5E9'
            });
        }
        
    };

    function previewFile() {
        let preview = document.querySelector('#AdImg');
        let file    = document.querySelector('input[type=file]').files[0];
        let reader  = new FileReader();
    
        reader.onloadend = function () {
        preview.src = reader.result;
        }
    
        if (file) {
        reader.readAsDataURL(file);
        preview.classList.remove("hideAdImg");
        preview.classList.add("showAdImg");
        } else {
        preview.src = "";
        }
    };
</script>

<template>
    <Head title="Создание объявления" />

    <AuthenticatedLayout>
        
        <div class="titleText">Создание объявления</div>
        <Form @submit="submit" :validation-schema="validate">
            <div>
                <div class="inputList" id="inputList">
                    <div class="titleAd">
                        <InputLabel class="titleAdText" for="title" value="Название:" />

                        <Field 
                            name="title"                            
                            id="title"
                            type="text"
                            class="titleAdInput"
                            v-model="form.title"
                            autofocus
                            autocomplete="title"
                            maxlength="200"
                            v-on:change="isChangedIInput"
                        />

                        <InputError class="mt-2" :message="form.errors.title" />
                        <ErrorMessage name="title" class="errorMessage" />
                    </div>

                    <div class="descriptionAd">
                        <InputLabel class="descriptionAdText" for="description" value="Описание:" />

                        <Field name="description" v-slot="{ field }">
                            <TextareaInput
                                v-bind="field"
                                name="description"
                                id="description"
                                type="text"
                                class="descriptionAdInput"
                                v-model="form.description"
                                maxlength="1500"
                                autocomplete="description"
                                v-on:change="isChangedIInput"
                            />
                        </Field>

                        <InputError class="mt-2" :message="form.errors.description" />
                        <ErrorMessage name="description" class="errorMessage" />
                    </div>

                    <div class="priceAd">
                        <InputLabel class="priceAdText" for="price" value="Цена:" />

                        <Field
                            name="price"
                            id="price"
                            type="number"
                            class="priceAdInput"
                            v-model="form.price"
                            autocomplete="price"
                            v-on:change="isChangedIInput"
                        /> 

                        <InputError class="mt-2" :message="form.errors.price" />
                        <ErrorMessage name="price" class="errorMessage" />
                    </div>

                    <div class="cityAd">
                        <InputLabel class="cityAdText" for="city" value="Местоположение:" />

                        <Field
                            name="city"
                            id="city"
                            type="text"
                            class="cityAdInput"
                            v-model="form.city"
                            maxlength="200"
                            autocomplete="city"
                            v-on:change="isChangedIInput"
                        />

                        <InputError class="mt-2" :message="form.errors.city" />
                        <ErrorMessage name="city" class="errorMessage" />
                    </div>
                </div>

                <div class="uploadBox" id="uploadBox">
                    <div class="imgUploadBox" id="imgUploadBox">
                        <img class="hideAdImg" id="AdImg"/>
                        <label class="inputUploadLabel" id="inputUploadLabel" for="inputUpload">Загрузить фото</label>
                        <Field
                            @change="previewFile(), isChangedIInput()" 
                            name="picture" 
                            id="inputUpload" 
                            class="inputUpload" 
                            type="file"
                            @input="form.picture = $event.target.files[0]"
                        />
                        <InputError class="mt-2" :message="form.errors.picture" />
                        <ErrorMessage name="picture" class="errorMessage" />
                    </div>
                    
                    <TextInput type="submit" id="buttonSave" class="buttonSave" value="Создать объявление" :class="{ 'opacity-25': form.processing }" :disabled="form.processing"/>
                </div>
                
            </div>
        </Form>
    </AuthenticatedLayout>
</template>