class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.521.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.521.0/snyk-macos"
    sha256 "70eb8d943f8a621e042f8ba96c557964f15e8c528cb1d9ca92ce3efbcf941c49"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.521.0/snyk-linux"
    sha256 "9c95ed0464db6824f7760972e97c20306e9fdf4e8882a715c32c75dd171b2317"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
