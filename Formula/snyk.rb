class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.347.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.347.1/snyk-macos"
    sha256 "7cca436e802da159dc24568a8a71b896c49113e768f497e515c1318e42718892"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.347.1/snyk-linux"
    sha256 "ab9a863a8ba28d30f3bd47a02a4b4f7fec1d8c2f11a41dfb59e26e5d51d42fbf"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
