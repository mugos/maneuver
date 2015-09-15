require 'test_helper'
require 'tempfile'

class HostConnectionTest < MiniTest::Spec
  let (:key) { Key::Create.(key: {
    name: "SSH Key Name",
    value: 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDSKzkgcjEl2igUez3BeSTsbscAtGPEoiT4VrJIqtEWFZtya3RWp0BWOdL7X1aQBtMqlgLSvDGFSzQ1gsHzcjLSfrNEMXRywun+tiGVkTuq2bZ3cVXGd1rhgjw3EaOYinfyMN3ltCaOJoU71Auvj2bgQvG9CVITGw9ykC0qLqwzqcJM26KGPKpWDhEWr+8hbPgN5bux+sPJn1RP50wmuDRHJgquEe5bE0xArisAgtrMVmrKFJlJlc0J/9kkW3s4KBXseNRgWbgGfDSTtInoVPDKH4AB7pgivQKeDHeI1HFyoA7op3f4dExNCzYu9Yj1WIYsayeimTLRjlNwWLJyGGJv example@maneuver.com'
  }).model }

  # port: 49154
  let (:host) { Host::Create.(
    host: {
      name: "Test Host",
      address: ENV['TEST_PORT_22_TCP_ADDR'],
      sys_user: "root",
      source: "~/source/application",
      key: { id: key.id }
    }
  ).model }

  # describe "connection" do
  #   it "should ping host" do
  #     tmp = Tempfile.new("test_temp")
  #     tmp << key.value
  #     tmp.rewind
  #     ssh_key = tmp.path
  #
  #     command = Caracara::SSH.generate host.sys_user, host.address, ['ls'], { key: ssh_key }
  #     # byebug
  #     Caracara::SSH.exec(command)
  #     tmp.unlink
  #   end
  # end

end # HostCrud
