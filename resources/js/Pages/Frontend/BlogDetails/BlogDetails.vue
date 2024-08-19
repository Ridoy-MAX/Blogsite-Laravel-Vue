<!-- resources/js/Pages/Welcome.vue -->
<script setup>
import { Head, Link } from '@inertiajs/vue3';
import Layout from '@/Layouts/Index.vue';

import './BlogDetails.css';
// Define props received from layout
defineProps({
    auth: Object,
    canLogin: Boolean,
    canRegister: Boolean,
    laravelVersion: String,
    phpVersion: String,
});
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
                        <h2>Top 10 Google’s Most Searched Movies in the World (2022)</h2>
                        <div class="count d-flex ">
                            <span><i class="fa-regular fa-user me-1"></i>Ridoy Hasan</span>
                            <span><i class="fa-regular fa-eye ms-5 me-1"></i>40</span>
                            <span><i class="fa-regular fa-calendar-days ms-5"></i> 15 December 2024</span>
                        </div>

                        <div class="image w-100">
                            <img src="/blog/two.jpg" alt="">

                        </div>

                        <p>We explore the latest trends in Movies, share insightful articles, and provide valuable
                            resources for
                            Audience. Whether you're looking for tips, news, or in-depth analysis, you've come to the
                            right place!

                            Are you ready to put your observation skills to the test? Picture puzzles are more than just
                            fun—they’re a fantastic way to sharpen your mind and boost your IQ!

                            Research shows that solving puzzles like these can enhance cognitive functions, improve
                            memory, and even increase your attention to detail.



                            Here is a challenge for you that will not only tickle your brain but also reveal just how
                            sharp your visual perception is.

                            Hidden within the depths of this walk-in closet is a sneaky cat—can you find it in just 12
                            seconds

                            Are you ready to put your observation skills to the test? Picture puzzles are more than just
                            fun—they’re a fantastic way to sharpen your mind and boost your IQ!

                            Research shows that solving puzzles like these can enhance cognitive functions, improve
                            memory, and even increase your attention to detail.



                            Here is a challenge for you that will not only tickle your brain but also reveal just how
                            sharp your visual perception is.

                            Hidden within the depths of this walk-in closet is a sneaky cat—can you find it in just 12
                            seconds

                            Are you ready to put your observation skills to the test? Picture puzzles are more than just
                            fun—they’re a fantastic way to sharpen your mind and boost your IQ!

                            Research shows that solving puzzles like these can enhance cognitive functions, improve
                            memory, and even increase your attention to detail.



                            Here is a challenge for you that will not only tickle your brain but also reveal just how
                            sharp your visual perception is.

                            Hidden within the depths of this walk-in closet is a sneaky cat—can you find it in just 12
                            seconds

                            Are you ready to put your observation skills to the test? Picture puzzles are more than just
                            fun—they’re a fantastic way to sharpen your mind and boost your IQ!

                            Research shows that solving puzzles like these can enhance cognitive functions, improve
                            memory, and even increase your attention to detail.



                            Here is a challenge for you that will not only tickle your brain but also reveal just how
                            sharp your visual perception is.

                            Hidden within the depths of this walk-in closet is a sneaky cat—can you find it in just 12
                            seconds
                        </p>


                    </div>
                </div>
                <div class="col-md-4">
                    <div class="sidebar_blog m-2">
                        <h2>Latest Stories</h2>

                        <div class=" row sidebar_blog_card">
                            <div class=" col-md-5">
                                <img src="/blog/two.jpg" alt="" class="w-100">

                            </div>

                            <div class=" col-md-7">
                                <link rel="stylesheet" href="">
                                <Link href="">
                                <p>Top 10 Google’s Most Searched Movies in the World (2022)
                                </p>
                                </Link>

                            </div>

                        </div>

                        <div class=" row sidebar_blog_card">
                            <div class=" col-md-5">
                                <img src="/blog/two.jpg" alt="" class="w-100">

                            </div>

                            <div class=" col-md-7">
                                <link rel="stylesheet" href="">
                                <Link href="">
                                <p>Top 10 Google’s Most Searched Movies in the World (2022)
                                </p>
                                </Link>

                            </div>

                        </div>
                        <div class=" row sidebar_blog_card">
                            <div class=" col-md-5">
                                <img src="/blog/two.jpg" alt="" class="w-100">

                            </div>

                            <div class=" col-md-7">
                                <link rel="stylesheet" href="">
                                <Link href="">
                                <p>Top 10 Google’s Most Searched Movies in the World (2022)
                                </p>
                                </Link>

                            </div>

                        </div>
                        <div class=" row sidebar_blog_card">
                            <div class=" col-md-5">
                                <img src="/blog/two.jpg" alt="" class="w-100">

                            </div>

                            <div class=" col-md-7">
                                <link rel="stylesheet" href="">
                                <Link href="">
                                <p>Top 10 Google’s Most Searched Movies in the World (2022)
                                </p>
                                </Link>

                            </div>

                        </div>
                        <div class=" row sidebar_blog_card">
                            <div class=" col-md-5">
                                <img src="/blog/two.jpg" alt="" class="w-100">

                            </div>

                            <div class=" col-md-7">
                                <link rel="stylesheet" href="">
                                <Link href="">
                                <p>Top 10 Google’s Most Searched Movies in the World (2022)
                                </p>
                                </Link>

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
