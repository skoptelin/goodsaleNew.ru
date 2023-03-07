<script setup>
    import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
    import InputError from '@/Components/InputError.vue';
    import InputLabel from '@/Components/InputLabel.vue';
    import TextInput from '@/Components/TextInput.vue';
    import { Head, useForm } from '@inertiajs/vue3';
    import TextareaInput from '@/Components/Ads/TextareaInput.vue';
    import Swal from 'sweetalert2';
    import { Form, Field, ErrorMessage } from 'vee-validate';
    import * as yup from 'yup';
    import { Inertia } from '@inertiajs/inertia';

    const props = defineProps({
        ad: {
            type: Object,
            default: () => ({}),
        },
    });

    Inertia.on('before', (event) => { // Отслеживаем переход на другую страницу, предлагаем сохранить если что то изменено при уходе со страницы
        if (isChangedIInputFlag === 'true') {
            event.preventDefault();
            Swal.fire({
                title: 'Сохранить изменения?',
                showDenyButton: true,
                showCancelButton: true,
                confirmButtonText: 'Сохранить',
                confirmButtonColor: '#0EA5E9',
                denyButtonText: `Не сохранять`,
                cancelButtonText: 'Закрыть',
            }).then((result) => {
                    if (result.isConfirmed) {
                        document.querySelector('.buttonSave').click();
                        Swal.fire('Изменения сохранены', '', 'success');
                        window.location = event.detail.visit.url.href;
                    } else if (result.isDenied) {
                        Swal.fire('Изменения не сохранены', '', 'info');
                        window.location = event.detail.visit.url.href;
                    }
                })
        }
        
    });

    let isChangedIInputFlag = 'false'; //Флаг изменения инпутов

    function isChangedIInput() {
        if(form.title != props.ad.title || form.description != props.ad.description || form.price != props.ad.price || form.city != props.ad.city || form.picture != props.ad.picture) {
            isChangedIInputFlag = 'true';
        } else {
            isChangedIInputFlag = 'false';
        }
        
    };

    const form = useForm({
        _method: 'put',
        title: props.ad.title,
        description: props.ad.description,
        price: props.ad.price,
        city: props.ad.city,
        picture:props.ad.picture,

    });

    const validate = yup.object({
       title: yup.string().required('Заполните название объявления').max(200, 'Превышено максимальное количество символов: 200'),
       description: yup.string().required('Заполните описание объявления').max(1500, 'Превышено максимальное количество символов: 1500'),
       price: yup.number().positive('Цена должна быть положительным числом').integer('Цена должна быть целым числом'),
       city: yup.string().required('Заполните местоположение').max(200, 'Превышено максимальное количество символов: 200'),
       picture: yup.mixed().nullable()
                    .test('fileFormat', 'Только фото в формате: jpg, jpeg, gif, png', 
                        (value) => {
                            if (value) {
                                return value && ['image/jpg', 'image/jpeg', 'image/gif', 'image/png'].includes(value.type);
                            } else {
                                return true
                            }  
                        }
                    )
                    .test('fileSize', 'Размер фото не должен превышать 5 МБ', 
                        (value) => {
                            if (value) {
                               return value.size <= 5000000  //value.size on bytes
                            } else {
                                return true
                            }  
                        }
                    ) 
                               
    });

    const submit = async() => {
        isChangedIInputFlag = 'false';
        try {
            const buttonSave = document.querySelector(".buttonSave");
            let id = buttonSave.dataset.adId;
            await form.post(route('my_ads.update', id), {
                onFinish: () =>  Swal.fire({
                                    position: 'top-end',
                                    icon: 'success',
                                    title: 'Изменения сохранены',
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

    function getImgUrl(fileName) {
        return "/@imagetools/" + fileName;
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
    <Head title="Изменение объявления" />

    <AuthenticatedLayout>
        
        <div class="titleText">Изменение объявления</div>

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
                            autocomplete="title"
                            maxlength="200"
                            v-on:change="isChangedIInput"
                        />

                        <InputError class="mt-2" :message="form.errors.title" />
                        <ErrorMessage name="title" class="errorMessage" />
                    </div>

                    <div class="descriptionAd">
                        <InputLabel class="descriptionAdText" for="description" value="Описание:" />

                        <Field name="description" v-slot="{ field }" v-model="form.description">
                            <TextareaInput
                                v-bind="field"
                                name="description"
                                id="description"
                                type="text"
                                class="descriptionAdInput"
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
                            maxlength="20"
                            autocomplete="description"
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
                        <img class="showAdImg" id="AdImg" :src="getImgUrl(ad.picture)"/>
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
                    
                    <TextInput :data-ad-id="ad.id" type="submit" id="buttonSave" class="buttonSave" value="Сохранить изменения" :class="{ 'opacity-25': form.processing }" :disabled="form.processing"/>
                </div>
                
            </div>
        </form>
    </AuthenticatedLayout>
</template>