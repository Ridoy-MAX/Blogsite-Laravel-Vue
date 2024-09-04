<script setup>
import { ref } from 'vue';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, router } from '@inertiajs/vue3';
import { useForm } from '@inertiajs/vue3';
import { Link } from '@inertiajs/vue3';
import Swal from 'sweetalert2';


const props = defineProps({
    tags: {
        type: Array, 
        required: true
    }
});
// Use the useForm hook to handle form data and submission
const form = useForm({
    name: '',
});

// Ref for the file input
const fileInputRef = ref(null);

// Handle form submission
const submitForm = () => {
    form.post(route('tag.add'), {
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
                title: 'Tag Created',
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


const deleteBlog = async () => {
    try {

        Swal.fire({
            icon: 'success',
            title: 'Tag Deleted',
            text: 'The Tag has been deleted successfully.',
        }).then(() => {
            router.get(route('tag')); 
        });
    } catch (error) {
        Swal.fire({
            icon: 'error',
            title: 'Delete Failed',
            text: 'There was an issue deleting the Tag.',
        });
    }
};
</script>

<template>

    <Head title="Blog Create" />
    <AuthenticatedLayout>
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-md-8">

                        <table class="table mt-5">
                            <thead>
                                <tr>
                                    <th scope="col" style="color: aliceblue;">#</th>
                                    <th scope="col" style="color: aliceblue;">Name</th>
                                    <th scope="col" style="color: aliceblue;">Date</th>
                                    <th scope="col" style="color: aliceblue;">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(tag, index) in props.tags.data" :key="tag.id" class="w-full">
                                    <th scope="row" style="color: aliceblue;">
                                        {{ (props.tags.current_page - 1) * props.tags.per_page + index + 1 }}
                                    </th>
                                    <td style="color: aliceblue;">{{ tag.name }} </td>
                                    <td style="color: aliceblue;">
                                        {{ new Date(tag.created_at).toLocaleDateString('en-GB', {
                                            day: '2-digit',
                                            month: 'long',
                                            year: 'numeric'
                                        }) }}
                                    </td>
                                    <td style="color: aliceblue;">
                                        <Link :href="route('tag.delete', tag.id)" @click="deleteBlog()"
                                            class="text-red-500 text-white ml-2 bg-red-900 p-2 m-1">
                                        <i class="fa-regular fa-trash-can"></i>
                                        </Link>
                                    </td>
                                </tr>
                             
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-4">
                        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8 space-y-6 p-3">
                            <header>
                                <div class="d-flex justify-content-between">
                                    <h2 class="text-lg font-medium text-gray-900 dark:text-gray-100">Add tag </h2>

                                </div>
                            </header>
                            <form @submit.prevent="submitForm" class="mt-6 space-y-6" enctype="multipart/form-data">
                                <div>
                                    <p class="mt-1 text-sm text-gray-600 dark:text-gray-400">Title</p>
                                    <input id="title" v-model="form.name" type="text"
                                        class="mt-1 block w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm w-100"
                                        required autofocus />
                                    <InputError class="mt-2" :message="form.errors.name" />
                                </div>







                                <div class="flex items-center gap-4">
                                    <button type="submit" class="btn btn-primary w-100"
                                        style="background-color: blueviolet; border: none;">Create</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </section>
    </AuthenticatedLayout>
</template>
