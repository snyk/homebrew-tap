class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.395.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.395.0/snyk-macos"
    sha256 "26ba1f713b9404808d2f1aff4bbd4dff5e470a6d4b6d639caa7f32ac8f816aa3"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.395.0/snyk-linux"
    sha256 "7def5a06642e79cf4e3473e86abc909064fbb695e9d228161367df81f3f8e45a"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
