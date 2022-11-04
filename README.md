# Blog app

This is a Catalog of blogs created with ruby, rails and PostgreSQL.

# ER diagram

<img src="./public/blog.png"></img>

## Getting Started

- Make sure you have Postgres and Ruby installed.
- Open the terminal window and clone the repository using this command: git clone https://github.com/Shubh-Dev/blog-bloggy.git
- Open the repo by typing : cd bloggy-app
- Install the project's dependencies by running this command: bundle install
- Run `rails db:create` to create the database.
- Run rails `rails db:schema:load` to create the relations in the database for the project based on the schema file inside the `db` folder. 
- Run rails server or rails s to start the application on local server.
- To test the project, run rspec in your terminal

## Run tests
    Run bundle install
    Run rubocop
    Run rspec

## API endpoints

### Posts
    GET /api/v1/users/user_id/posts

### Comments
    GET /api/v1/users/user_id/posts/post_id/comments
    POST /api/v1/users/user_id/posts/post_id/comments
    
## Author

👤 **Shubh Dev**

- GitHub: [@Shubh-Dev](https://github.com/Shubh-Dev) 
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/shubhscb/)


## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Hat tip to anyone whose code was used
- Inspiration
- etc

## 📝 License

This project is [MIT](./LICENSE.md) licensed.
