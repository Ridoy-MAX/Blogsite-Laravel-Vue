<script setup>

import { ref, onMounted } from 'vue';
import { Head, usePage, Link } from '@inertiajs/vue3';

import { defineProps } from 'vue';
import Layout from '@/Layouts/Index.vue';
import Blog from '../Blog/Blog.vue';
import About from '../About/About.vue';
import Contact from '../Contact/Contact.vue';
import Preloader from '@/Components/Preloader.vue'; // Import Preloader component
import './Home.css';


const props = defineProps({
  // General props from layout
  blogs: {
    type: Array,
    required: true
  },
  auth: {
    type: Object,
    required: true
  },
  canLogin: {
    type: Boolean,
    required: true
  },
  canRegister: {
    type: Boolean,
    required: true
  },
  laravelVersion: {
    type: String,
    required: true
  },
  phpVersion: {
    type: String,
    required: true
  },

  // Specific props for the component
  title: {
    type: Object,
    required: true
  },
  description: {
    type: Object,
    required: true
  },
  facebook: {
    type: Object,
    required: true
  },
  instagram: {
    type: Object,
    required: true
  },
  twitter: {
    type: Object,
    required: true
  },
  threads: {
    type: Object,
    required: true
  },
  about: {
    type: Object,
    required: true
  }
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
              <h2> {{ props.title.title }} </h2>
              <h1>{{ props.description.title }}
              </h1>

              <div class='mt-5'>
                <div class="social_link d-flex">
                  <div class="two d-flex">
                    <div class="icon">


                      <a :href="props.facebook.title" target="_blank">
                        <i class="fa-brands fa-facebook-f"></i>
                      </a>



                    </div>
                    <div class="icon">
                      <a :href="props.instagram.title" target="_blank" rel="noopener noreferrer">
                        <i class="fa-brands fa-instagram"></i>
                      </a>
                    </div>
                    <div class="icon">
                      <a :href="props.twitter.title"  target="_blank"><i class="fa-brands fa-x-twitter"></i></a>
                    </div>
                    <div class="icon">
                      <a :href="props.threads.title"  target="_blank" rel="noopener noreferrer">
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

      <Blog :blogs="blogs" />
      <About :about="about"/>
      <Contact />
    </Layout>
  </div>
</template>
