<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, router, usePage } from '@inertiajs/vue3';
import { ref, watch, onMounted } from 'vue';
import { Link } from '@inertiajs/vue3';
import Swal from 'sweetalert2'; // Import SweetAlert2

const props = defineProps({
    blogs: {
        type: Array,
        required: true
    }
});

const truncateText = (text, wordLimit = 5) => {
    const words = text.split(' ');
    return words.slice(0, wordLimit).join(' ') + (words.length > wordLimit ? '...' : '');
};


const deleteBlog = async () => {
    try {
        // await router.put(route('users.update', selectedUser.value.id), updatedUser.value);
        Swal.fire({
            icon: 'success',
            title: 'Blog Delete',
            text: 'The Blog  has been Delete successfully.',
        }).then(() => {
            fetchUsers(currentPage.value, searchQuery.value);
            closeModals();
        });
    } catch (error) {
        Swal.fire({
            icon: 'error',
            title: 'Update Failed',
            text: 'There was an issue updating the user.',
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

                        <Link :href="route('blog.create')" class=" btn btn-secondary"> Create blog <i
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
                              
                                <tr v-for="(blog, index) in props.blogs" :key="blogs.id" class="w-full">
                                    <!-- Serial Number -->
                                    <td class="py-2 px-4 border-b text-white">1
                                    </td>

                                    <!-- User Details -->
                                    <td class="py-2 px-4 border-b text-white">
                                        <img :src="blog.image" alt="none" class="sm:rounded-lg" style="width: 100px;" />
                                        <!-- <img src="/images/1724319213.jpg" alt="none" class="sm:rounded-lg" style="width: 100px;"> -->
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

                                    <!-- <td class="py-2 px-4 border-b text-white"><span
                                        class="badge bg-success">Active</span></td> -->


                                    <td class="py-2 px-4 border-b text-white">
                                        {{ new Date(blog.created_at).toLocaleDateString('en-GB', {
                                            day: '2-digit',
                                            month:
                                                'long', year: 'numeric'
                                        }) }}
                                    </td>



                                    <td class="py-2 px-4 border-b text-white">
                                        <!-- Edit and Delete Buttons -->
                                        <Link  :href="route('blog.details', blog.slug)" class="text-blue-500 text-white bg-sky-500 p-2 m-1 " > <i class="fa-regular fa-eye"></i></Link>

                                        <Link  :href="route('blog.edit', blog.slug)" class="text-blue-500 text-white bg-sky-500 p-2 m-1 " >
                                            <i
                                            class="fa-regular fa-pen-to-square"></i></Link>

                                 

                                    
                                     

                                                <Link  :href="route('blog.delete', blog.slug)"  @click="deleteBlog()" class="text-red-500 text-white ml-2 bg-red-900 p-2 m-1" >
                                                    <i class="fa-regular fa-trash-can"></i> </Link>
                                    
                                    </td>
                                </tr>

                            </tbody>

                        </table>
                    </div>
                </div>


            </div>
        </div>
    </AuthenticatedLayout>
</template>
