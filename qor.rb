class Qor < Formula
   desc "Cli v2 (using Go)"
   homepage "https://github.com/Qordobacode/Cli-v2"
   url "https://github.com/Qordobacode/Cli-v2/archive/v0.8.1-alpha1.tar.gz"
   sha256 "a2b83e0e4dbcafbaf7b45f7c258be1d52f63f7edd72898f5be58cf2b0fd4bd4b"
   head "https://github.com/Qordobacode/Cli-v2.git"

   depends_on "go" => :build

   def install
     ENV["GOPATH"] = buildpath
     src = buildpath/"src/github.com/qordobacode/cli-v2"
     src.install buildpath.children
     src.cd do
       system "go", "build", "-mod", "vendor", "-ldflags", "\"-w -s -X 'github.com/qordobacode/cli-v2/cmd/info.VersionFlag=v0.8.1-alpha1'\"", "-o", "#{bin}/qor"
       prefix.install_metafiles
     end
   end

   test do
     assert_match "Qordoba Cli v4.0", shell_output("#{bin}/qor --version")
   end
 end