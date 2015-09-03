class GitCloneTask < Caracara::Task
  # Clone the repository
  step 'git clone {{repository}} {{dest}}/scm/{{version}} --recursive'

  # Run commands inside the repo folder
  dir '{{dest}}/scm/{{version}}' do
    # Checkout to the lastest tag
    step 'git checkout {{version}}'

    # Remove .git/ folder
    step 'rm -rf .git/'
  end
end
