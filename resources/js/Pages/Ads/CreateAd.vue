<script setup>
    import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
    import InputError from '@/Components/InputError.vue';
    import InputLabel from '@/Components/InputLabel.vue';
    import TextInput from '@/Components/TextInput.vue';
    import { Head, useForm } from '@inertiajs/vue3';
    import TextareaInput from '@/Components/Ads/TextareaInput.vue';

    const form = useForm({
        title: '',
        description: '',
        price: '',
        city: '',
        picture: '',
    });

    const submit = async() => {
        await form.post(route('my_ads.store'));
    };

    function previewFile() {
        let preview = document.querySelector('img');
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

        <form @submit.prevent="submit">
            <div>
                <div class="inputList" id="inputList">
                    <div class="titleAd">
                        <InputLabel class="titleAdText" for="title" value="Название:" />

                        <TextInput
                            id="title"
                            type="text"
                            class="titleAdInput"
                            v-model="form.title"
                            required
                            maxlength="200"
                            autofocus
                            autocomplete="title"
                        />

                        <InputError class="mt-2" :message="form.errors.title" />
                    </div>

                    <div class="descriptionAd">
                        <InputLabel class="descriptionAdText" for="description" value="Описание:" />

                        <TextareaInput
                            id="description"
                            type="text"
                            class="descriptionAdInput"
                            v-model="form.description"
                            required
                            maxlength="1500"
                            autofocus
                            autocomplete="description"
                        />

                        <InputError class="mt-2" :message="form.errors.description" />
                    </div>

                    <div class="priceAd">
                        <InputLabel class="priceAdText" for="price" value="Цена:" />

                        <TextInput
                            id="price"
                            type="number"
                            class="priceAdInput"
                            v-model="form.price"
                            required
                            maxlength="20"
                            autofocus
                            autocomplete="description"
                        />

                        <InputError class="mt-2" :message="form.errors.price" />
                    </div>

                    <div class="cityAd">
                        <InputLabel class="cityAdText" for="city" value="Местоположение:" />

                        <TextInput
                            id="city"
                            type="text"
                            class="cityAdInput"
                            v-model="form.city"
                            required
                            maxlength="200"
                            autofocus
                            autocomplete="city"
                        />

                        <InputError class="mt-2" :message="form.errors.city" />
                    </div>
                </div>

                <div class="uploadBox" id="uploadBox">
                    <div class="imgUploadBox" id="imgUploadBox">
                        <img class="hideAdImg" id="AdImg"/>
                        <label class="inputUploadLabel" id="inputUploadLabel" for="inputUpload">Загрузить фото</label>
                        <TextInput
                        @change="previewFile()" 
                        name="picture" 
                        id="inputUpload" 
                        class="inputUpload" 
                        type="file"
                        @input="form.picture = $event.target.files[0]"
                        required
                        />
                    </div>
                    
                    <TextInput type="submit" id="buttonSave" class="buttonSave" value="Создать объявление"/>
                </div>
                
            </div>
        </form>
    </AuthenticatedLayout>
</template>