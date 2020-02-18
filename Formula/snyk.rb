class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.292.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.292.0/snyk-macos"
    sha256 "13bad26311ccaf56b70566fb0a77b64e1fb2edeadd777fee8cd72e3f637f65ce"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.292.0/snyk-linux"
    sha256 "ed247ccfa5ca0504f6367842f85084dd836664114e139bc2b16581001284e660"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
