class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.606.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.606.0/snyk-macos"
    sha256 "603982a734591c66800f624cbe5a2067d53b62303b69bc32393aa8d3d9898e5a"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.606.0/snyk-linux"
    sha256 "87fddf1b20199c135b7de2b67990042d82606f42e36aea71a6abe78093036f64"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
