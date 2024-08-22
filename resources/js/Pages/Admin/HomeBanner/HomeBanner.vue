<script setup>
import { ref } from 'vue';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, router } from '@inertiajs/vue3';
import { useForm } from '@inertiajs/vue3';
import { Link } from '@inertiajs/vue3';
import Swal from 'sweetalert2';


const props = defineProps({
    title: {
        type: Object, // Use Object to handle a single blog
        required: true
    },
    description: {
        type: Object, // Use Object to handle a single blog
        required: true
    },
    facebook: {
        type: Object, // Use Object to handle a single blog
        required: true
    },
    instagram: {
        type: Object, // Use Object to handle a single blog
        required: true
    },
    twitter: {
        type: Object, // Use Object to handle a single blog
        required: true
    },
    threads: {
        type: Object, // Use Object to handle a single blog
        required: true
    },
    about: {
        type: Object, // Use Object to handle a single blog
        required: true
    },
});
// Use the useForm hook to handle form data and submission
const form = useForm({
    title: props.title.title,
    description: props.description.title,
    facebook: props.facebook.title,
    instagram: props.instagram.title,
    twitter: props.twitter.title,
    threads: props.threads.title,
    about: props.about.title,
});

// Ref for the file input
const fileInputRef = ref(null);

// Handle form submission
const submitForm = () => {
    form.post(route('home.banner.update'), {
        onError: (errors) => {
            Swal.fire({
                icon: 'error',
                title: 'Create Failed',
                text: 'There was an issue creating the blog.',
            });
        },
        onSuccess: () => {
            Swal.fire({
                icon: 'success',
                title: 'Updated',
                text: ' Update successfully.',
            }).then(() => {
                // Reset form data
                form.reset();

                // Manually reset the file input by recreating the element
                if (fileInputRef.value) {
                    fileInputRef.value.value = null;
                }
            });
        }
    });
};
</script>

<template>
    <Head title="Blog Create" />
    <AuthenticatedLayout>
        <section>
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8 space-y-6 p-3">
                <header>
                    <div class="d-flex justify-content-between">
                        <h2 class="text-lg font-medium text-gray-900 dark:text-gray-100">Add Home banner Information</h2>
                        <!-- <Link :href="route('blogs')" class="btn btn-danger">Back</Link> -->
                    </div>
                </header>
                <form @submit.prevent="submitForm" class="mt-6 space-y-6" enctype="multipart/form-data">
                    <div>
                        <p class="mt-1 text-sm text-gray-600 dark:text-gray-400">Title</p>
                        <input id="title" v-model="form.title" type="text"
                            class="mt-1 block w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm w-100"
                            required autofocus />
                        <InputError class="mt-2" :message="form.errors.title" />
                    </div>

                    <div>
                        <p class="mt-1 text-sm text-gray-600 dark:text-gray-400">Description</p>
                        <textarea id="description" v-model="form.description" style="height: 300px;"
                            class="border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm w-100"
                            required></textarea>
                        <InputError class="mt-2" :message="form.errors.description" />
                    </div>

                    <p class="mt-1 text-sm text-gray-600 dark:text-gray-400">Social Link</p>
                    <div class="d-flex"  >
                        <i class="fa-brands fa-facebook-f m-3" style="font-size: 30px;color: aliceblue;"></i> 
                        <input id="title" v-model="form.facebook" type="text"
                            class="mt-1 block w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm w-100"
                            required autofocus />
                        <InputError class="mt-2" :message="form.errors.facebook" />
                    </div>
                    <div class="d-flex"  >
                        <i class="fa-brands fa-instagram m-3" style="font-size: 30px;color: aliceblue;"></i> 
                        <input id="title" v-model="form.instagram" type="text"
                            class="mt-1 block w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm w-100"
                            required autofocus />
                        <InputError class="mt-2" :message="form.errors.instagram" />
                    </div>
                    <div class="d-flex"  >
                        <i class="fa-brands fa-x-twitter m-3" style="font-size: 30px;color: aliceblue;"></i> 
                        <input id="title" v-model="form.twitter" type="text"
                            class="mt-1 block w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm w-100"
                            required autofocus />
                        <InputError class="mt-2" :message="form.errors.twitter" />
                    </div>
                    <div class="d-flex"  >
                        <i class="fa-brands fa-threads m-3" style="font-size: 30px;color: aliceblue;"></i> 
                        <input id="title" v-model="form.threads" type="text"
                            class="mt-1 block w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm w-100"
                            required autofocus />
                        <InputError class="mt-2" :message="form.errors.threads" />
                    </div>

                    <header>
                    <div class="d-flex justify-content-between">
                        <h2 class="text-lg font-medium text-gray-900 dark:text-gray-100">About</h2>
                        <!-- <Link :href="route('blogs')" class="btn btn-danger">Back</Link> -->
                    </div>
                </header>
                
                <div>
                        <p class="mt-1 text-sm text-gray-600 dark:text-gray-400">About us</p>
                        <textarea id="description" v-model="form.about" style="height: 200px;"
                            class="border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm w-100"
                            required></textarea>
                        <InputError class="mt-2" :message="form.errors.about" />
                    </div>

                    <div class="flex items-center gap-4">
                        <button type="submit" class="btn btn-primary w-100"
                            style="background-color: blueviolet; border: none;">Save</button>
                    </div>
                </form>
            </div>
        </section>
    </AuthenticatedLayout>
</template>
