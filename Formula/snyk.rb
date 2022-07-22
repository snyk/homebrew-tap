class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.979.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.979.0/snyk-macos"
    sha256 "6f65bb8bd9f19724c584bd6671a056c9c798e17d4ec4e04cd9ce8ce318f0858a"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.979.0/snyk-linux"
    sha256 "31396d12102ae0593b950e98860a90d1ba0c3bbb6cc6ed570e1ac1a3aef7dc1b"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
