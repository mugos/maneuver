require 'test_helper'

class SongCell < Cell::ViewModel
  self.view_paths = ['test/fixtures']
  # include ::Cell::Erb

  def show
    render
  end

  def ivar
    @title = "Carnage"
    render
  end

  def unknown
    render
  end

  def string
    "Right"
  end

  # TODO: just pass hash.
  def with_locals
    render locals: {length: 280, title: "Shot Across The Bow"}
  end

  def with_erb
    render template_engine: :erb
  end

  def with_view_name
    @title = "Man Of Steel"
    render :ivar
  end

  def receiving_options(layout=:default)
    "#{layout}"
  end

  def with_html
    render
  end

private
  def title
    "Papertiger"
  end
end

class RenderTest < MiniTest::Spec
  # render show.haml calling method, implicit render.
  it { SongCell.new(nil).show.must_equal "Papertiger\n" }

  # render ivar.haml using instance variable.
  it { SongCell.new(nil).ivar.must_equal "Carnage\n" }

  # render string.
  it { SongCell.new(nil).string.must_equal "Right" }

  # #call renders :show
  it { SongCell.new(nil).call.must_equal "Papertiger\n" }

  # call(:form) renders :form
  it { SongCell.new(nil).call(:with_view_name).must_equal "Man Of Steel\n" }

  # #call returns html_safe.
  it { SongCell.new(nil).call.must_be_instance_of ActiveSupport::SafeBuffer }

  # throws an exception when not found.
  it do
    exception = assert_raises(Cell::TemplateMissingError) { SongCell.new(nil).unknown }
    exception.message.must_equal "Template missing: view: `unknown.erb` prefixes: [\"test/fixtures/song\"]"
  end

  # allows locals
  it { SongCell.new(nil).with_locals.must_equal "Shot Across The Bow\n280\n" }

  # render :form is a shortcut.
  it { SongCell.new(nil).with_view_name.must_equal "Man Of Steel\n" }

  # :template_engine renders ERB.
  # it { SongCell.new(nil).with_erb.must_equal "ERB:\n<span>\n  Papertiger\n</span>" }

  # view: "show.html"

  # allows passing in options DISCUSS: how to handle that in cache block/builder?
  it { SongCell.new(nil).receiving_options.must_equal "default" }
  it { SongCell.new(nil).receiving_options(:fancy).must_equal "fancy" }
  it { SongCell.new(nil).call(:receiving_options, :fancy).must_equal "fancy" }

  # doesn't escape HTML.
  it { SongCell.new(nil).call(:with_html).must_equal "<p>Yew!</p>" }
end

# test inheritance
# with layout and locals.