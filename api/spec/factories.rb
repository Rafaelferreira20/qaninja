require_relative "models/user_model"

FactoryBot.define do

    factory :user, class: UserModel do
        full_name { "Rafael Ferreira" }
        email { "sf.rafael20@gmail.com" }
        password { "teste652" }

        after(:build) do |user|
            Database.new.deleteUser(user.email)
        end
    end
 
    factory :registered_user, class: UserModel do
        full_name { "Vader Ferreira" }
        email { "vader@gmail.com" }
        password { "teste652" }

        after(:build) do |user|
            Database.new.deleteUser(user.email)
            ApiUser.save(user.to_hash)
        end
    end

    factory :user_wrong_email, class: UserModel do
        full_name { "Rafael Ferreira" }
        email { "sf.rafael20#gmail.com" }
        password { "teste652" }
    end

    factory :empty_name_user, class: UserModel do
        full_name { "" }
        email { "sf.rafael20#gmail.com" }
        password { "teste652" }
    end

    factory :empty_email_user, class: UserModel do
        full_name { "Rafael Ferreira" }
        email { "" }
        password { "teste652" }
    end

    factory :empty_password_user, class: UserModel do
        full_name { "Rafael Ferreira" }
        email { "sf.rafael20#gmail.com" }
        password { "" }
    end

    factory :null_name_user, class: UserModel do
        email { "sf.rafael20@gmail.com" }
        password { "teste652" }
    end

    factory :null_email_user, class: UserModel do
        full_name { "Rafael Ferreira" }
        password { "teste652" }
    end

    factory :null_password_user, class: UserModel do
        full_name { "Rafael Ferreira" }
        email { "sf.rafael20@gmail.com" }
    end
end