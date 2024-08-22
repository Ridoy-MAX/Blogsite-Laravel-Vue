<script setup>
import { ref } from 'vue';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, router } from '@inertiajs/vue3';
import { useForm } from '@inertiajs/vue3';
import { Link } from '@inertiajs/vue3';
import Swal from 'sweetalert2';

// Use the useForm hook to handle form data and submission
const form = useForm({
    title: '',
    description: '',
    status: '',
    image: null, // To store uploaded image
});

// Ref for the file input
const fileInputRef = ref(null);

// Handle form submission
const submitForm = () => {
    form.post(route('blog.add'), {
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
                title: 'Blog Created',
                text: 'The blog has been created successfully.',
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
                        <h2 class="text-lg font-medium text-gray-900 dark:text-gray-100">Add Blog Information</h2>
                        <Link :href="route('blogs')" class="btn btn-danger">Back</Link>
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

                    <div>
                        <p class="mt-1 text-sm text-gray-600 dark:text-gray-400">Status</p>
                        <select id="status" v-model="form.status"
                            class="border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm w-100"
                            required>
                            <option selected disabled>Select status</option>
                            <option value="Active">Active</option>
                            <option value="Deactive">Deactive</option>
                        </select>
                        <InputError class="mt-2" :message="form.errors.status" />
                    </div>

                    <div>
                        <p class="mt-1 text-sm text-gray-600 dark:text-gray-400">Upload Image</p>
                        <input type="file" ref="fileInputRef" @change="form.image = $event.target.files[0]" name="image">
                        <progress v-if="form.progress" :value="form.progress.percentage" max="100">
                            {{ form.progress.percentage }}%
                        </progress>
                        <InputError class="mt-2" :message="form.errors.image" />
                    </div>

                    <div class="flex items-center gap-4">
                        <button type="submit" class="btn btn-primary w-100"
                            style="background-color: blueviolet; border: none;">Create</button>
                    </div>
                </form>
            </div>
        </section>
    </AuthenticatedLayout>
</template>
