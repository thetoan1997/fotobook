# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Picture.destroy_all
# Picture.create!([
#     {
#             picture_link: "#",
#             title: "pic2user",
#             description: "nice",
#             private: false,
#             pictureable_id: 2,
#             pictureable_type: "User"
#     },
#     {
#             picture_link: "#",
#             title: "pic1album",
#             description: "nice",
#             private: false,
#             pictureable_id: 1,
#             pictureable_type: "Album"
#     },
#     {
#             picture_link: "#",
#             title: "pic2album",
#             description: "nice",
#             private: false,
#             pictureable_id: 2,
#             pictureable_type: "Album"
#     },
#     {
#             picture_link: "#",
#             title: "pic2user",
#             description: "nice",
#             private: false,
#             pictureable_id: 3,
#             pictureable_type: "User"
#     },
#     {
#             picture_link: "#",
#             title: "pic3user",
#             description: "nice",
#             private: false,
#             pictureable_id: 3,
#             pictureable_type: "User"
#     },
#     {
#             picture_link: "#",
#             title: "pic3album",
#             description: "nice",
#             private: false,
#             pictureable_id: 2,
#             pictureable_type: "Album"
#     },
#     {
#             picture_link: "#",
#             title: "pic2user",
#             description: "nice",
#             private: false,
#             pictureable_id: 2,
#             pictureable_type: "Album"
#     },
#     {
#             picture_link: "#",
#             title: "pic2user",
#             description: "nice",
#             private: false,
#             pictureable_id: 5,
#             pictureable_type: "User"
#     }
# ])
# Album.destroy_all
# Album.create!([
#     {
#         title: "album1",
#         description: "nice",
#         private: false,
#         user_id: 2
#     },
#     {
#         title: "album2",
#         description: "nice",
#         private: false,
#         user_id: 2
#     },
#     {
#         title: "album3",
#         description: "nice",
#         private: false,
#         user_id: 1
#     },
#     {
#         title: "album4",
#         description: "nice",
#         private: false,
#         user_id: 3
#     },
#     {
#         title: "album5",
#         description: "nice",
#         private: false,
#         user_id: 4
#     },
#     {
#         title: "album5",
#         description: "nice",
#         private: false,
#         user_id: 3
#     },
#     {
#         title: "album5",
#         description: "nice",
#         private: false,
#         user_id: 3
#     },
#     {
#         title: "album5",
#         description: "nice",
#         private: false,
#         user_id: 3
#     },
#     {
#         title: "album5",
#         description: "nice",
#         private: false,
#         user_id: 3
#     },
#     {
#         title: "album5",
#         description: "nice",
#         private: false,
#         user_id: 3
#     },
#     {
#         title: "album5",
#         description: "nice",
#         private: false,
#         user_id: 3
#     },
#     {
#         title: "album5",
#         description: "nice",
#         private: false,
#         user_id: 3
#     },
#     {
#         title: "album5",
#         description: "nice",
#         private: false,
#         user_id: 4
#     }
# ])
# User.destroy_all
# User.create!([
#     {
#         firstname: "diep",
#         lastname: "toan",
#         username: "diep",
#         password: "123",
#         avatar_link: "#"
#     },
#     {
#         firstname: "dan",
#         lastname: "thy",
#         username: "thy",
#         password: "123",
#         avatar_link: "#"
#     },
#     {
#         firstname: "khanh",
#         lastname: "tran",
#         username: "tran",
#         password: "123",
#         avatar_link: "#"
#     },
#     {
#         firstname: "diep1",
#         lastname: "toan",
#         username: "diep1",
#         password: "123",
#         avatar_link: "#"
#     },
#     {
#         firstname: "diep2",
#         lastname: "toan",
#         username: "diep2",
#         password: "123",
#         avatar_link: "#"
#     }
# ])
# UserFollowing.destroy_all
# UserFollowing.create!([
#     {
#         follower_id: 1,
#         followed_id: 4,
#         date: Time.now.strftime("%Y-%d-%m %H:%M:%S %Z")
#     },
#     {
#         follower_id: 1,
#         followed_id: 3,
#         date: Time.now.strftime("%Y-%d-%m %H:%M:%S %Z")
#     },
#     {
#         follower_id: 2,
#         followed_id: 5,
#         date: Time.now.strftime("%Y-%d-%m %H:%M:%S %Z")
#     },
#     {
#         follower_id: 3,
#         followed_id: 1,
#         date: Time.now.strftime("%Y-%d-%m %H:%M:%S %Z")
#     },
#     {
#         follower_id: 5,
#         followed_id: 4,
#         date: Time.now.strftime("%Y-%d-%m %H:%M:%S %Z")
#     }
# ])

Like.create!([
    {
        :user_id => 1,
        :likeable_id => 4,
        :likeable_type => "Picture"
    },
    {
        :user_id => 2,
        :likeable_id => 5,
        :likeable_type => "Album" 
    },
    {
        :user_id => 2,
        :likeable_id => 4,
        :likeable_type => "Picture" 
    },
    {
        :user_id => 3,
        :likeable_id => 1,
        :likeable_type => "Picture"
    },
    {
        :user_id => 5,
        :likeable_id => 5,
        :likeable_type => "Album"
    }
])