class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.978.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.978.0/snyk-macos"
    sha256 "7a3f2d67ec96a9c300b076ca14ca7095e12e64ea727211962a021041b926dc41"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.978.0/snyk-linux"
    sha256 "7bf4817ffd231020d94559417bb2f1d5e94c5ddff93f3e0cea4da0ef368b374d"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
