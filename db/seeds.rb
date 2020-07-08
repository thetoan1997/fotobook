# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Photo.destroy_all
# Photo.create!([
#     {
#             title: "My fish",
#             description: "nice",
#             private: false,
#             user_id: 1
#     },
#     {
#             title: "My hometown",
#             description: "nice",
#             private: false,
#             user_id: 3
#     },
#     {
#             title: "My summer",
#             description: "nice",
#             private: false,
#             user_id: 2
#     },
#     {
#             title: "My vacation",
#             description: "nice",
#             private: false,
#             user_id: 3
#     },
#     {
#             title: "That's so amazing",
#             description: "nice",
#             private: false,
#             user_id: 2
#     },
#     {
#             title: "That looks great",
#             description: "nice",
#             private: false,
#             user_id: 2
#     },
#     {
#             title: "My farm",
#             description: "nice",
#             private: false,
#             user_id: 3
#     },
#     {
#             title: "The evening on farm",
#             description: "nice",
#             private: false,
#             user_id: 2
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
#         password: "12345678",
#         avatar_link: "https://i.imgur.com/AqmDqLt.png",
#         email: "example1@gmail.com"
#     },
#     {
#         firstname: "Fernando",
#         lastname: "Elnino",
#         username: "Torres",
#         password: "12345678",
#         avatar_link: "https://i.imgur.com/AqmDqLt.png",
#         email: "example2@gmail.com"
#     },
#     {
#         firstname: "khanh",
#         lastname: "tran",
#         username: "tran",
#         password: "12345678",
#         avatar_link: "https://i.imgur.com/XWw3jtJ.jpg",
#         email: "example3@gmail.com"
#     },
#     {
#         firstname: "diep1",
#         lastname: "toan",
#         username: "diep1",
#         password: "12345678",
#         avatar_link: "https://i.imgur.com/XWw3jtJ.jpg",
#         email: "example4@gmail.com"
#     },
#     {
#         firstname: "diep2",
#         lastname: "toan",
#         username: "diep2",
#         password: "12345678",
#         avatar_link: "https://i.imgur.com/XWw3jtJ.jpg",
#         email: "example5@gmail.com"
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
#     },
#     {
#         follower_id: 2,
#         followed_id: 3,
#         date: Time.now.strftime("%Y-%d-%m %H:%M:%S %Z")
#     },
#     {
#         follower_id: 3,
#         followed_id: 2,
#         date: Time.now.strftime("%Y-%d-%m %H:%M:%S %Z")
#     },
#     {
#         follower_id: 2,
#         followed_id: 1,
#         date: Time.now.strftime("%Y-%d-%m %H:%M:%S %Z")
#     }
# ])

# Like.create!([
#     {
#         :user_id => 1,
#         :likeable_id => 4,
#         :likeable_type => "Photo"
#     },
#     {
#         :user_id => 2,
#         :likeable_id => 5,
#         :likeable_type => "Album" 
#     },
#     {
#         :user_id => 2,
#         :likeable_id => 4,
#         :likeable_type => "Photo" 
#     },
#     {
#         :user_id => 3,
#         :likeable_id => 1,
#         :likeable_type => "Photo"
#     },
#     {
#         :user_id => 5,
#         :likeable_id => 5,
#         :likeable_type => "Album"
#     }
# ])
Image.delete_all
Image.create!([
    {
        :image_url => "https://i.imgur.com/FYySxYP.png",
        :imageable_id => 2,
        :imageable_type => "Photo"
    },
    {
        :image_url => "https://i.imgur.com/nYP0Tzp.jpg",
        :imageable_id => 5,
        :imageable_type => "Album" 
    },
    {
        :image_url => "https://i.imgur.com/nYP0Tzp.jpg",
        :imageable_id => 3,
        :imageable_type => "Photo" 
    },
    {
        :image_url => "https://i.imgur.com/yxPbY0m.jpg",
        :imageable_id => 1,
        :imageable_type => "Photo"
    },
    {
        :image_url => "https://i.imgur.com/yxPbY0m.jpg",
        :imageable_id => 5,
        :imageable_type => "Album"
    },
    {
        :image_url => "https://i.imgur.com/tzfDzjg.jpg",
        :imageable_id => 5,
        :imageable_type => "Photo"
    },
    {
        :image_url => "https://i.imgur.com/s4EC8PF.jpg",
        :imageable_id => 4,
        :imageable_type => "Photo"
    },
    {
        :image_url => "https://i.imgur.com/N4p08WV.jpg",
        :imageable_id => 6,
        :imageable_type => "Photo"
    },
    {
        :image_url => "https://i.imgur.com/n2kJrTq.jpg",
        :imageable_id => 8,
        :imageable_type => "Photo"
    },
    {
        :image_url => "https://i.imgur.com/30qHzo9.jpg",
        :imageable_id => 7,
        :imageable_type => "Photo"
    },
    {
        :image_url => "https://i.imgur.com/yxPbY0m.jpg",
        :imageable_id => 5,
        :imageable_type => "Album"
    },
    {
        :image_url => "https://i.imgur.com/n2kJrTq.jpg",
        :imageable_id => 5,
        :imageable_type => "Album"
    },
    {
        :image_url => "https://i.imgur.com/45MAGel.jpg",
        :imageable_id => 3,
        :imageable_type => "Album"
    },
    {
        :image_url => "https://i.imgur.com/hRUxhN2.jpg",
        :imageable_id => 4,
        :imageable_type => "Album"
    },
    {
        :image_url => "https://i.imgur.com/yxPbY0m.jpg",
        :imageable_id => 10,
        :imageable_type => "Album"
    },
    {
        :image_url => "https://i.imgur.com/n2kJrTq.jpg",
        :imageable_id => 10,
        :imageable_type => "Album"
    },
    {
        :image_url => "https://i.imgur.com/45MAGel.jpg",
        :imageable_id => 10,
        :imageable_type => "Album"
    },
    {
        :image_url => "https://i.imgur.com/hRUxhN2.jpg",
        :imageable_id => 10,
        :imageable_type => "Album"
    },
    {
        :image_url => "https://i.imgur.com/yxPbY0m.jpg",
        :imageable_id => 11,
        :imageable_type => "Album"
    },
    {
        :image_url => "https://i.imgur.com/s4EC8PF.jpg",
        :imageable_id => 12,
        :imageable_type => "Album"
    },
    {
        :image_url => "https://i.imgur.com/N4p08WV.jpg",
        :imageable_id => 11,
        :imageable_type => "Album"
    },
    {
        :image_url => "https://i.imgur.com/n2kJrTq.jpg",
        :imageable_id => 11,
        :imageable_type => "Album"
    },
    {
        :image_url => "https://i.imgur.com/30qHzo9.jpg",
        :imageable_id => 12,
        :imageable_type => "Album"
    },
    {
        :image_url => "https://i.imgur.com/nYP0Tzp.jpg",
        :imageable_id => 13,
        :imageable_type => "Album" 
    },
    {
        :image_url => "https://i.imgur.com/nYP0Tzp.jpg",
        :imageable_id => 13,
        :imageable_type => "Album" 
    },
    {
        :image_url => "https://i.imgur.com/yxPbY0m.jpg",
        :imageable_id => 13,
        :imageable_type => "Album"
    }
])