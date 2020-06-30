class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.352.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.352.1/snyk-macos"
    sha256 "75ccb5e73c02355f616a960318e0faa8c463029bdb4e51e54e7675fde4ed1596"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.352.1/snyk-linux"
    sha256 "e27ee828b21d91c8a6d05bec65d5c867ef6c05dd6ed9fad6b65f34c88d945951"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
