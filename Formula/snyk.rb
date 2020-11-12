class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.425.3"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.425.3/snyk-macos"
    sha256 "8457eeda9273487148f9c58c3627f72ade64f31cfb3bba27555955a08899141c"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.425.3/snyk-linux"
    sha256 "32faf7455fe65b6949fc8804dd80ccca51ba1bc820441838e0b50407a3ee889f"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
