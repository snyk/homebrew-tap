class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.657.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.657.0/snyk-macos"
    sha256 "cf1dd866805dda07ee7ecd3d7ed6ae7a9af5b757e2de889ecffa734f8e4db285"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.657.0/snyk-linux"
    sha256 "af8c2afbdf97b4a6b1fcd5908475431496374e411bebf2c9e4839e8c714ce982"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
