<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, router, usePage } from '@inertiajs/vue3';
import { ref, watch, onMounted } from 'vue';
import { Link } from '@inertiajs/vue3';
import Swal from 'sweetalert2'; 

const props = defineProps({
    blogs: {
        type: Object, 
        required: true
    }
});

const truncateText = (text, wordLimit = 5) => {
    const words = text.split(' ');
    return words.slice(0, wordLimit).join(' ') + (words.length > wordLimit ? '...' : '');
};

const deleteBlog = async () => {
    try {

        Swal.fire({
            icon: 'success',
            title: 'Blog Deleted',
            text: 'The blog has been deleted successfully.',
        }).then(() => {
            router.get(route('blogs')); 
        });
    } catch (error) {
        Swal.fire({
            icon: 'error',
            title: 'Delete Failed',
            text: 'There was an issue deleting the blog.',
        });
    }
};
</script>

<template>

    <Head title="Blog" />

    <AuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">Blogs</h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8 space-y-6">
                <div class="p-4 sm:p-8 dark:bg-gray-800 shadow sm:rounded-lg">
                    <div class="d-flex justify-content-between">
                        <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight"> Blog List</h2>

                        <Link :href="route('blog.create')" class="btn btn-secondary"> Create blog <i
                            class="fa-solid fa-plus"></i></Link>
                    </div>
                    <div class="overflow-x-auto">
                        <table class="min-w-full">
                            <thead>
                                <tr class="w-full">
                                    <th class="py-2 px-4 border-b text-white">ID</th>
                                    <th class="py-2 px-4 border-b text-white">Image</th>
                                    <th class="py-2 px-4 border-b text-white">Title</th>
                                    <th class="py-2 px-4 border-b text-white">Created By</th>
                                    <th class="py-2 px-4 border-b text-white">Status</th>
                                    <th class="py-2 px-4 border-b text-white">Created At</th>
                                    <th class="py-2 px-4 border-b text-white">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(blog, index) in props.blogs.data" :key="blog.id" class="w-full">
                                    <td class="py-2 px-4 border-b text-white">
                                        {{ (props.blogs.current_page - 1) * props.blogs.per_page + index + 1 }}
                                    </td>
                                    <td class="py-2 px-4 border-b text-white">
                                        <img :src="blog.image" alt="none" class="sm:rounded-lg" style="width: 100px;" />
                                    </td>
                                    <td class="py-2 px-4 border-b text-white">
                                        {{ truncateText(blog.title) }}
                                    </td>
                                    <td class="py-2 px-4 border-b text-white">{{ blog.user.name }}</td>
                                    <td class="py-2 px-4 border-b text-white">
                                        <span :class="['badge', blog.status === 'Active' ? 'bg-success' : 'bg-danger']">
                                            {{ blog.status }}
                                        </span>
                                    </td>
                                    <td class="py-2 px-4 border-b text-white">
                                        {{ new Date(blog.created_at).toLocaleDateString('en-GB', {
                                            day: '2-digit',
                                            month: 'long',
                                            year: 'numeric'
                                        }) }}
                                    </td>
                                    <td class="py-2 px-4 border-b text-white">
                                        <Link :href="route('blog.details', blog.slug)"
                                            class="text-blue-500 text-white bg-sky-500 p-2 m-1 ">
                                        <i class="fa-regular fa-eye"></i>
                                        </Link>
                                        <Link :href="route('blog.edit', blog.slug)"
                                            class="text-blue-500 text-white bg-sky-500 p-2 m-1 ">
                                        <i class="fa-regular fa-pen-to-square"></i>
                                        </Link>
                                        <Link :href="route('blog.delete', blog.slug)" @click="deleteBlog()"
                                            class="text-red-500 text-white ml-2 bg-red-900 p-2 m-1">
                                        <i class="fa-regular fa-trash-can"></i>
                                        </Link>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <!-- Pagination Links -->
                    <div class="mt-4 flex justify-center">
                        <nav aria-label="Page navigation example">
                            <ul class="inline-flex items-center space-x-2">
                                
                                <li v-for="page in props.blogs.links" :key="page.label"
                                    :class="{ 'bg-indigo-500 text-white': page.active }" class="page-item">
                                    <Link v-if="page.url" :href="page.url"
                                        class="px-3 py-2 border border-gray-300 rounded-md text-gray-500 hover:bg-gray-100"
                                        :class="{ 'bg-indigo-500 text-white': page.active }" v-html="page.label">
                                    </Link>
                                    <span v-else
                                        class="px-3 py-2 border border-gray-300 rounded-md text-gray-500 cursor-not-allowed"
                                        v-html="page.label"></span>
                                </li>

                             
                            </ul>
                        </nav>
                    </div>


                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
