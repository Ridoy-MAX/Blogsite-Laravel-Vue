<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, router, usePage } from '@inertiajs/vue3';
import { ref, watch, onMounted } from 'vue';
import { Link } from '@inertiajs/vue3';
import Swal from 'sweetalert2'; 

const props = defineProps({
    contacts: {
        type: Array,
        required: true
    }
});

console.log(props.contacts);

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
            <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">Contact </h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8 space-y-6">
                <div class="p-4 sm:p-8 dark:bg-gray-800 shadow sm:rounded-lg">
                    <div class="d-flex justify-content-between">
                        <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight"> Contact List</h2>

                  
                    </div>
                    <div class="overflow-x-auto">
                        <table class="min-w-full">
                            <thead>
                                <tr class="w-full">
                                    <th class="py-2 px-4 border-b text-white">ID</th>
                                    <th class="py-2 px-4 border-b text-white">Name</th>
                                    <th class="py-2 px-4 border-b text-white">Email</th>
                                    <th class="py-2 px-4 border-b text-white">Subject</th>
                                    <th class="py-2 px-4 border-b text-white">Message</th>
                                    <th class="py-2 px-4 border-b text-white">Created At</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(contact, index) in props.contacts.data" :key="contact.id" class="w-full">
                                    <td class="py-2 px-4 border-b text-white">
                                        {{ (props.contacts.current_page - 1) * props.contacts.per_page + index + 1 }}
                                    </td>
                                    <td class="py-2 px-4 border-b text-white">
                                        {{ contact.name}}
                                      
                                    </td>
                                    <td class="py-2 px-4 border-b text-white">
                                        {{ contact.email}}
                                  
                                    </td>
                                    <td class="py-2 px-4 border-b text-white">    {{ contact.subject}} </td>
                                    <td class="py-2 px-4 border-b text-white">
                                        {{ truncateText(contact.message) }}
                                      
                                      
                                    </td>
                                    <td class="py-2 px-4 border-b text-white">
                                        {{ new Date(contact.created_at).toLocaleDateString('en-GB', {
                                            day: '2-digit',
                                            month: 'long',
                                            year: 'numeric'
                                        }) }}
                                    </td>
                                 
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <!-- Pagination Links -->
                    <div class="mt-4 flex justify-center">
                        <nav aria-label="Page navigation example">
                            <ul class="inline-flex items-center space-x-2">
                                
                                <li v-for="page in props.contacts.links" :key="page.label"
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
