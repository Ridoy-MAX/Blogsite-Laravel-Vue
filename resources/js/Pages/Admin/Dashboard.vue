<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, router, usePage } from '@inertiajs/vue3';
import { ref, watch, onMounted } from 'vue';
import Swal from 'sweetalert2'; // Import SweetAlert2

// Define props
const props = defineProps({
    users: {
        type: Array,
        default: () => [],
    },
    totalPages: {
        type: Number,
        default: 1,
    },
    currentPage: {
        type: Number,
        default: 1,
    },
    perPage: {
        type: Number,
        default: 10, // Adjust as necessary
    }
    
});

// State variables
const currentPage = ref(props.currentPage);
const searchQuery = ref('');
const showEditModal = ref(false);
const showDeleteModal = ref(false);
const selectedUser = ref(null);
const updatedUser = ref({ name: '', email: '' });
const successMessage = ref('');

// Access Inertia page properties
const page = usePage();
const flashMessages = page.props.flash || {};

// Initialize success message if it exists
if (flashMessages.success) {
    successMessage.value = flashMessages.success;
    setTimeout(() => successMessage.value = '', 5000); // Clear message after 5 seconds
}

// Watch for changes in currentPage
watch(() => props.currentPage, (newPage) => {
    currentPage.value = newPage;
});

// Watch for changes in searchQuery
watch(searchQuery, (newQuery) => {
    router.get(route('dashboard'), { page: 1, search: newQuery }, { preserveState: true });
});

// Format date
const formatDate = (dateString) => {
    const options = { year: 'numeric', month: 'long', day: 'numeric' };
    return new Date(dateString).toLocaleDateString(undefined, options);
};

// Handlers
const handleEdit = (user) => {
    selectedUser.value = user;
    updatedUser.value = { name: user.name, email: user.email };
    showEditModal.value = true;
};

const handleDelete = (user) => {
    selectedUser.value = user;
    showDeleteModal.value = true;
};

const closeModals = () => {
    showEditModal.value = false;
    showDeleteModal.value = false;
    selectedUser.value = null;
};

const updateUser = async () => {
    try {
        await router.put(route('users.update', selectedUser.value.id), updatedUser.value);
        Swal.fire({
            icon: 'success',
            title: 'User Updated',
            text: 'The user has been updated successfully.',
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

const deleteUser = async () => {
    try {
        await router.delete(route('users.destroy', selectedUser.value.id));
        Swal.fire({
            icon: 'success',
            title: 'User Deleted',
            text: 'The user has been deleted successfully.',
        }).then(() => {
            fetchUsers(currentPage.value, searchQuery.value);
            closeModals();
        });
    } catch (error) {
        Swal.fire({
            icon: 'error',
            title: 'Delete Failed',
            text: 'There was an issue deleting the user.',
        });
    }
};

const handlePageChange = (pageNumber) => {
    currentPage.value = pageNumber;
    router.get(route('dashboard'), { page: pageNumber, search: searchQuery.value }, { preserveState: true });
};

const fetchUsers = (page, query) => {
    router.get(route('dashboard'), { page, search: query }, { preserveState: true });
};

const calculateSerialNumber = (index) => {
    return (currentPage.value - 1) * props.perPage + (index + 1);
};
</script>

<template>

     <Head title="Dashboard" />

    <AuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">Dashboard</h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="dark:bg-gray-800 overflow-hidden shadow-sm sm:rounded-lg">
                    <div class="p-6 text-gray-900 dark:text-gray-100">
                        <h3 class="text-lg font-semibold mb-4">User List</h3>

                        <!-- Success Message -->
                        <div v-if="successMessage" class="mb-4 p-4 bg-green-100 border border-green-400 text-green-700 rounded">
                            {{ successMessage }}
                        </div>

                        <!-- Search Bar -->
                        <input type="text" v-model="searchQuery" placeholder="Search by name or email"
                            class="p-2 mb-3 sm:p-3 dark:bg-gray-800 shadow sm:rounded-lg w-full" />

                        <!-- Responsive Table -->
                        <div class="overflow-x-auto">
                            <table class="min-w-full">
                                <thead>
                                    <tr class="w-full">
                                        <th class="py-2 px-4 border-b">ID</th>
                                        <th class="py-2 px-4 border-b">Name</th>
                                        <th class="py-2 px-4 border-b">Email</th>
                                        <th class="py-2 px-4 border-b">Created At</th>
                                        <th class="py-2 px-4 border-b">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
    <tr v-for="(user, index) in props.users" :key="user.id" class="w-full">
        <!-- Serial Number -->
        <td class="py-2 px-4 border-b">{{ (currentPage - 1) * perPage + (index + 1) }}</td>
        
        <!-- User Details -->
        <td class="py-2 px-4 border-b">{{ user.name }}</td>
        <td class="py-2 px-4 border-b">{{ user.email }}</td>
        <td class="py-2 px-4 border-b">{{ formatDate(user.created_at) }}</td>
        <td class="py-2 px-4 border-b">
            <!-- Edit and Delete Buttons -->
            <button class="text-blue-500 text-white bg-sky-500 p-2" @click="handleEdit(user)">Edit</button>
            <button class="text-red-500 text-white ml-2 bg-red-900 p-2" @click="handleDelete(user)">Delete</button>
        </td>
    </tr>
</tbody>

                            </table>
                        </div>

                        <!-- Pagination -->
                        <div class="flex justify-between items-center mt-4">
                            <button :disabled="currentPage === 1" @click="handlePageChange(currentPage - 1)"
                                class="px-4 py-2 bg-sky-300 rounded">
                                Previous
                            </button>

                            <span>Page {{ currentPage }} of {{ totalPages }}</span>

                            <button :disabled="currentPage === totalPages" @click="handlePageChange(currentPage + 1)"
                                class="px-4 py-2 bg-sky-300 rounded">
                                Next
                            </button>
                        </div>

                        <!-- Edit Modal -->
                        <div v-if="showEditModal" class="fixed inset-0 flex items-center justify-center ">
                            <div class=" p-4 sm:p-8  dark:bg-gray-800 shadow sm:rounded-lg">

                                <h2 class="text-lg font-medium text-gray-900 dark:text-gray-100">Edit User</h2>

                                <p class="mt-1 text-sm text-gray-600 dark:text-gray-400">
                                    Update your account's profile information and email address.
                                </p>

                                <form @submit.prevent="updateUser">
                                    <div class="mb-4">
                                        <label for="name" class="">Name</label>

                                        <input type="text" id="name" v-model="updatedUser.name"
                                            class="border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm w-100" />
                                    </div>
                                    <div class="mb-4">
                                        <label for="email" class="">Email</label>
                                        <input type="email" id="email" v-model="updatedUser.email"
                                            class="border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm w-100" />
                                    </div>
                                    <div class="flex justify-end">
                                        <button type="button" @click="closeModals"
                                            class="px-4 py-2 bg-gray-300 rounded mr-2">
                                            Cancel
                                        </button>
                                        <button type="submit" class="px-4 py-2 bg-sky-500 text-white rounded">
                                            Save
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <!-- Delete Modal -->
                        <div v-if="showDeleteModal"
                            class="fixed inset-0 flex items-center justify-center bg-black bg-opacity-50">
                            <div class=" p-6 rounded-lg shadow-lg p-4 sm:p-8  dark:bg-gray-800 shadow sm:rounded-lg">

                                <h2 class="text-lg font-medium text-gray-900 dark:text-gray-100">Delete User</h2>

                                <p class="mt-1 text-sm text-gray-600 dark:text-gray-400">
                                    Are you sure you want to delete this user?
                                </p>

                                <div class="flex justify-end mt-4">
                                    <button type="button" @click="closeModals"
                                        class="px-4 py-2 bg-gray-300 rounded mr-2">
                                        Cancel
                                    </button>
                                    <button @click="deleteUser" class="px-4 py-2 bg-red-500 text-white rounded">
                                        Delete
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
