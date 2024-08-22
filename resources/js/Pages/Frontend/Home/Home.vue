<script setup>
import { ref, onMounted } from 'vue';
import { Head, Link, usePage } from '@inertiajs/vue3';
import Layout from '@/Layouts/Index.vue';
import Blog from '../Blog/Blog.vue';
import About from '../About/About.vue';
import Contact from '../Contact/Contact.vue';
import Preloader from '@/Components/Preloader.vue'; // Import Preloader component
import './Home.css';

// Define props received from layout
defineProps({
  blogs: Array,
  auth: Object,
  canLogin: Boolean,
  canRegister: Boolean,
  laravelVersion: String,
  phpVersion: String,
});

// Preloader state
const loading = ref(true);

// Check if it's the home page and show preloader
const { url } = usePage().props;

onMounted(() => {
  if (url === '/') {
    // Show preloader for home page
    setTimeout(() => {
      loading.value = false; // Hide preloader after a delay or when loading is done
    }, 2000); // Adjust time as needed
  } else {
    loading.value = false; // Don't show preloader on other pages
  }
});
</script>

<template>
  <div v-if="loading">
    <Preloader />
  </div>
  <div v-else>
    <Layout :auth="auth" :can-login="canLogin" :can-register="canRegister" :laravel-version="laravelVersion"
      :php-version="phpVersion">
      <Head title="Welcome" />
      <div class="container mt-3" id="home">
        <div class="row mt-5">
          <div class="col-md-12">
            <div class="home_section_one">
              <h2>Welcome to My Blog Site</h2>
              <h1>We explore the latest trends in Movies, share insightful articles, and provide valuable resources for
                Audience. Whether you're looking for tips, news, or in-depth analysis, you've come to the right place!
              </h1>

              <div class='mt-5'>
                <div class="social_link d-flex">
                  <div class="two d-flex">
                    <div class="icon">
                      <a href="" target='blank'><i class="fa-brands fa-facebook-f"></i></a>
                    </div>
                    <div class="icon">
                      <a href="" target="_blank" rel="noopener noreferrer">
                        <i class="fa-brands fa-instagram"></i>
                      </a>
                    </div>
                    <div class="icon">
                      <a href="" target="_blank"><i class="fa-brands fa-x-twitter"></i></a>
                    </div>
                    <div class="icon">
                      <a href="" target="_blank" rel="noopener noreferrer">
                        <i class="fa-brands fa-threads"></i>
                      </a>
                    </div>
                  </div>
                </div>
              </div>

            </div>
          </div>
        </div>
      </div>

      <Blog :blogs="blogs"/>
      <About />
      <Contact />
    </Layout>
  </div>
</template>
