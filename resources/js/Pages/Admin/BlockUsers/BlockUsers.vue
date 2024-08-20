<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, router, usePage } from '@inertiajs/vue3';
import { Link } from '@inertiajs/vue3';
import { ref, watch } from 'vue';
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
        default: 10,
    },
});

// State variables
const currentPage = ref(props.currentPage);
const searchQuery = ref('');
const showDeleteModal = ref(false);
const selectedUser = ref(null);
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
    router.get(route('block.user'), { page: 1, search: newQuery }, { preserveState: true });
});

// Format date
const formatDate = (dateString) => {
    const options = { year: 'numeric', month: 'long', day: 'numeric' };
    return new Date(dateString).toLocaleDateString(undefined, options);
};

// Handle user unblock
const handleDelete = (user) => {
    selectedUser.value = user;
    showDeleteModal.value = true;
};

// Close all modals
const closeModals = () => {
    showDeleteModal.value = false;
    selectedUser.value = null;
};

// Perform the unblock action and close the modal
const deleteUser = async () => {
    try {
        await router.post(route('users.unblock'));
        // Refresh the user list after unblocking
        fetchUsers(currentPage.value, searchQuery.value);
        closeModals(); // Close the modal after the user is unblocked
    } catch (error) {
        console.error('Error unblocking user:', error.response ? error.response.data : error.message);
    }
};

// Method to unblock a user directly from the button click
const unblockUser = async (userId) => {
    console.log('done')
    try {
        await router.post(route('users.unblock', { id: userId }));

        Swal.fire({
            icon: 'success',
            title: 'User  Unblocked',
            text: 'The user has been Unblocked successfully.',
        }).then(() => {
            // fetchUsers(currentPage.value, searchQuery.value);
            closeModals();
        });
        // Refresh the user list after unblocking
        // fetchUsers(currentPage.value, searchQuery.value);
    } catch (error) {
        console.error('Error unblocking user:', error.response ? error.response.data : error.message);
    }
};


// Handle page change
const handlePageChange = (pageNumber) => {
    currentPage.value = pageNumber;
    router.get(route('block.user'), { page: pageNumber, search: searchQuery.value }, { preserveState: true });
};

// Fetch users with the current page and search query
const fetchUsers = (page, query) => {
    router.get(route('block.user'), { page, search: query }, { preserveState: true });
};

// Calculate the serial number for users in the current page
const calculateSerialNumber = (index) => {
    return (currentPage.value - 1) * props.perPage + (index + 1);
};
</script>

<template>

    <Head title="Block Users" />

    <AuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">Block Users</h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="dark:bg-gray-800 overflow-hidden shadow-sm sm:rounded-lg">
                    <div class="p-6 text-gray-900 dark:text-gray-100">
                        <h3 class="text-lg font-semibold mb-4">User List</h3>

                        <!-- Success Message -->
                        <div v-if="successMessage"
                            class="mb-4 p-4 bg-green-100 border border-green-400 text-green-700 rounded">
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
                                        <td class="py-2 px-4 border-b">{{ calculateSerialNumber(index) }}</td>

                                        <td class="py-2 px-4 border-b">{{ user.name }}</td>
                                        <td class="py-2 px-4 border-b">{{ user.email }}</td>
                                        <td class="py-2 px-4 border-b">{{ formatDate(user.created_at) }}</td>
                                        <td class="py-2 px-4 border-b">
                                            <button class="text-red-500 text-white ml-2 bg-red-900 p-2"
                                                @click="unblockUser(user.id)">Unblock</button>
                                             
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

                        <!-- Delete Modal -->
                        <div v-if="showDeleteModal"
                            class="fixed inset-0 flex items-center justify-center bg-black bg-opacity-50">
                            <div class="p-6 rounded-lg shadow-lg p-4 sm:p-8 dark:bg-gray-800 shadow sm:rounded-lg">
                                <h2 class="text-lg font-medium text-gray-900 dark:text-gray-100">Unblock User</h2>

                                <p class="mt-1 text-sm text-gray-600 dark:text-gray-400">
                                    Are you sure you want to unblock this user?
                                </p>

                                <div class="flex justify-end mt-4">
                                    <button type="button" @click="closeModals"
                                        class="px-4 py-2 bg-gray-300 rounded mr-2">
                                        Cancel
                                    </button>
                                    <button @click="deleteUser" class="px-4 py-2 bg-red-500 text-white rounded">
                                        Unblock
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
