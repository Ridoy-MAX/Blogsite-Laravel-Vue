// store/index.js
import { createStore } from 'vuex';

export default createStore({
  state() {
    return {
      users: [],
      totalPages: 1,
      currentPage: 1,
      perPage: 10,
      successMessage: '',
    };
  },
  mutations: {
    setUsers(state, users) {
      state.users = users;
    },
    setTotalPages(state, totalPages) {
      state.totalPages = totalPages;
    },
    setCurrentPage(state, page) {
      state.currentPage = page;
    },
    setPerPage(state, perPage) {
      state.perPage = perPage;
    },
    setSuccessMessage(state, message) {
      state.successMessage = message;
    },
    clearSuccessMessage(state) {
      state.successMessage = '';
    },
  },
  actions: {
    async fetchUsers({ commit }, { page, query }) {
      try {
        const response = await axios.get(route('dashboard'), { params: { page, search: query } });
        commit('setUsers', response.data.users);
        commit('setTotalPages', response.data.totalPages);
        commit('setCurrentPage', page);
      } catch (error) {
        console.error('Failed to fetch users:', error);
      }
    },
    async updateUser({ dispatch }, { id, data }) {
      try {
        await axios.put(route('users.update', id), data);
        dispatch('fetchUsers', { page: this.state.currentPage, query: '' });
        dispatch('setSuccessMessage', 'User updated successfully.');
      } catch (error) {
        console.error('Failed to update user:', error);
      }
    },
    async deleteUser({ dispatch }, id) {
      try {
        await axios.delete(route('users.destroy', id));
        dispatch('fetchUsers', { page: this.state.currentPage, query: '' });
        dispatch('setSuccessMessage', 'User deleted successfully.');
      } catch (error) {
        console.error('Failed to delete user:', error);
      }
    },
    setSuccessMessage({ commit }, message) {
      commit('setSuccessMessage', message);
      setTimeout(() => {
        commit('clearSuccessMessage');
      }, 5000);
    },
  },
  getters: {
    users(state) {
      return state.users;
    },
    totalPages(state) {
      return state.totalPages;
    },
    currentPage(state) {
      return state.currentPage;
    },
    successMessage(state) {
      return state.successMessage;
    },
  },
});
