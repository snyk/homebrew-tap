class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.421.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.421.1/snyk-macos"
    sha256 "9b31ecaff48316a7bf1502101dd43d8b79a69f15e501f984b3a18d015ce694ce"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.421.1/snyk-linux"
    sha256 "ad91f1b807c8815b1efd2a9258f9ecbdda6af47803c5679d4562fe98e1a1e27b"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
