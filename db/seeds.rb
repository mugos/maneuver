# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

key = Key.new(name: "Amazon Key", value: "yebo.pem")
key.save!

host = Host.new(name: "Amazon", address: "54.233.83.73", sys_user: "ubuntu", source: "")
host.key = key
host.save!

git = Git.new(url: "git@bitbucket.org:yebo-dev/docker.git", type: "Repo::Bitbucket", api_key: 'Wm7bWtsqLYLxvIekX12gGY81i1dkqUV8')
git.save!

app = App.new(name: "Yebo", group: "AppGroup")
app.hosts << host
app.git = git
app.save!
