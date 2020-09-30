class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.404.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.404.0/snyk-macos"
    sha256 "6616c44ef6083727188fcd4293a5dec3d4f52cbb362dd4aa4cd255c7deabb8a4"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.404.0/snyk-linux"
    sha256 "ca7dacf26dd18adf25c2370252cd5a21a969409ce4fb5f1a65155b929debd40c"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
