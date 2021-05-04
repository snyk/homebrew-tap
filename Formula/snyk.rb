class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.576.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.576.0/snyk-macos"
    sha256 "7e5ff063f2ef661b9311e5bec162d26246b14037fc93e8f02cce6787280602db"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.576.0/snyk-linux"
    sha256 "f38135aa12568ea5c3c93221eb86d0dc6f51509e7f07392d3dfdc9f95951a52c"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
