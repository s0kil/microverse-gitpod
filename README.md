# Microverse Gitpod Configuration

## Benefits Of Using Gitpod Instead Of Your Local Machine

- Consistent Performance
  - After the first boot-up and installing editor extensions, Gitpod is consistent, Zoom is not stressing it's CPU, Chrome is not devouring it's RAM.
- Unlimited Internet
  - Gitpod has 1Gbps download/upload speeds, which means: No longer are you waisting your time and money (assuming capped data plan) to install Ruby, Node packages for every project.
- Resilient
  - Your power might go out, maybe you forgot to commit and push your changes, Gitpod does not care, it's still running.

## Benefits Of Using This Gitpod Configuration Instead Of Your Own

- Preinstalled And Prebuilt Packages
  - We pre-install many tools, so you don't waist your time waiting on "Building native extensions. This could take a while..."

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

- Copy the `.gitpod.yml` file (with its contents) to the root folder of your Git project directory
- Commit and push to GitHub
- Open your GitHub project in Gitpod:
  - Example: `https://gitpod.io/#https://github.com/e71az/private-events`

### Ruby on Rails Configuration

In order for Rails server to allow Gitpod preview access, let's configure it.

In the `config/environments/development.rb` file, add the following:

```ruby
Rails.application.configure do
  config.hosts = nil #<-- Add This Line
end
```
