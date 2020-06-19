class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.345.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.345.1/snyk-macos"
    sha256 "e3651ab822f39eaf5238d43de62d22873574dd187d943602a62f3c0d3dbdd3e5"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.345.1/snyk-linux"
    sha256 "67420f5a6b4bb4f417e274ed8e1f3aee99d85b7a507c1bc06aad77953c899954"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
