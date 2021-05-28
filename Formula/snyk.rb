class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.616.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.616.0/snyk-macos"
    sha256 "e2f2517fa2cb88d53175609019aa3eb32b8d63a08483465c85778a645a529b52"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.616.0/snyk-linux"
    sha256 "9d09fcc3971e6c8bc889e0dcbc9b34ba2095bfbd9194544490486f64d3e52d91"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
