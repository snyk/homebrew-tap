class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.346.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.346.0/snyk-macos"
    sha256 "ceea98da42fd795722258c220f4e9cbd893f6feb0018ab09a087a911b19c9f74"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.346.0/snyk-linux"
    sha256 "a0203fb183092f5c1b4c43d17690a762d9f690598f40e77870db84e08b83382c"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
