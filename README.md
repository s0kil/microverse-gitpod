# Microverse Gitpod Configuration

## Preinstalled With:

- eslint
- hint
- lighthouse
- node
- npm
- rails
- rspec
- rubocop
- stylelint
- yarn

## How To Utilize

- Copy the `.gitpod.yml` file (with its contents) to the root folder of your project directory
- Commit and push to GitHub
- Open your GitHub project in Gitpod:
  - Example: `https://gitpod.io/#https://github.com/e71az/private-events`

## Ruby on Rails Configuration

In order for Rails server to allow Gitpod preview access, let's configure it.

In the `config/environments/development.rb` file, add the following:

```ruby
Rails.application.configure do
  config.hosts = nil #<-- Add This Line
end
```
