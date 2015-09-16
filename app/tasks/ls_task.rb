#
class LsTask < Caracara::Task
  step 'ls {{#options}}-{{options}} {{/options}}{{dir}}'
end
