class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.695.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.695.0/snyk-macos"
    sha256 "b18aea8c013f206cd47c9b3d69b371a57e5dea809c82a90916c396e4491959d7"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.695.0/snyk-linux"
    sha256 "789ca0d9ccd035fdbf750328ec6ae805ae5f7cc6175873aa9acee85fb28e938a"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
