<!-- resources/js/Pages/Welcome.vue -->
<script setup>
import { Head, Link } from '@inertiajs/vue3';
import Layout from '@/Layouts/Index.vue';

import './BlogDetails.css';
// Define props received from layout
const props = defineProps({
    auth: {
        type: Object,
        default: () => ({}) // Default empty object
    },
    canLogin: {
        type: Boolean,
        default: false // Default false
    },
    canRegister: {
        type: Boolean,
        default: false // Default false
    },
    laravelVersion: {
        type: String,
        default: '' // Default empty string
    },
    phpVersion: {
        type: String,
        default: '' // Default empty string
    },
    blogs: {
        type: Array, // Use Array to handle multiple blogs if needed
        required: true
    },
    latestblogs: {
        type: Array, // Use Array to handle multiple blogs if needed
        required: true
    }
});

console.log(props.blogs);
</script>

<template>

    <Layout :auth="auth" :can-login="canLogin" :can-register="canRegister" :laravel-version="laravelVersion"
        :php-version="phpVersion">

        <Head title="Blog Details" />
        <div class="container mt-3 blog_details" id="blogDetails">
            <div class="row mt-5">
                <div class="col-md-8">
                    <div class="blog_details">
                        <div class="d-flex bradcome">
                            <Link href="/#home">
                            <p>Home >
                            </p>
                            </Link>
                            <Link href="/#blog">
                            <p>Blog >
                            </p>
                            </Link>
                            <Link href="">
                            <p>Blog Details
                            </p>
                            </Link>
                        </div>
                        <h2>{{ props.blogs.title }} </h2>
                        <div class="count d-flex ">
                            <span><i class="fa-regular fa-user me-1"></i>{{ props.blogs.user.name }}</span>

                            <span v-for="(tag, index) in props.blogs.tags" :key="index" class="badge bg-success ms-1">
                            {{ tag.name }}
                            </span>

                            <span><i class="fa-regular fa-eye ms-5 me-1"></i>{{ props.blogs.view }} </span>
                            <span><i class="fa-regular fa-calendar-days ms-5"></i>
                                {{ new Date(props.blogs.created_at).toLocaleDateString('en-GB', {
                                            day: '2-digit',
                                            month:
                                                'long', year: 'numeric'
                                        }) }}

                               </span>
                        </div>

                        <div class="image w-100">
                            <img  :src="props.blogs.image" alt="">

                        </div>

                        <p>{{ props.blogs.description }}
                        </p>


                    </div>
                </div>
                <div class="col-md-4">
                    <div class="sidebar_blog m-2">
                        <h2>Latest Stories</h2>

                        <div class="row sidebar_blog_card"   v-for="(latestblog, index) in latestblogs ">
                            <div class=" col-md-5">
                                <img :src="latestblog.image" alt="" class="w-100">

                            </div>

                            <div class=" col-md-7">
                                <link rel="stylesheet" href="">
                                <Link :href="route('blog.details', latestblog.slug)"
                                            class=" ">
                                            <p>
                                                {{ latestblog.title }} 

                                            </p>
                                </Link>

                                <span>
                                    <i class="fa-regular fa-calendar-days "></i>
                                {{ new Date(latestblog.created_at).toLocaleDateString('en-GB', {
                                            day: '2-digit',
                                            month:
                                                'long', year: 'numeric'
                                        }) }}

                               </span>

                            </div>

                        </div>


                 

                    </div>

                </div>
            </div>
        </div>

        <Blog />
        <About />
        <Contact />
    </Layout>


</template>
