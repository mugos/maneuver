class Build < ActiveRecord::Base
  belongs_to :app
  belongs_to :host

  scope :latest, lambda { all.limit(9).order("id DESC") }

  def script=(script)
    # TODO: FIll with host info
    options = {}

    command = self.app
      .group
      .constantize
      .init(options)
      .compile(script.to_sym)

    command = Caracara::SSH.generate('user', 'address', command)

    write_attribute(:script, command)
  end
end
