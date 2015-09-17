class Build < ActiveRecord::Base
  belongs_to :app
  belongs_to :host

  has_many :logs, as: :logable

  scope :latest, lambda { all.limit(9).order("id DESC") }

  def script=(script)
    # TODO: FIll with host info
    # TODO: Move to contract
    options = {}

    command = self.app
      .group
      .constantize
      .init(options)
      .compile(script.to_sym)

    command = Caracara::SSH.generate(host.sys_user, host.address, command, key: Rails.root.join('config', 'keys', host.key.value))

    write_attribute(:script, command)
  end
end
